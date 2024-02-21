import Handlebars from 'handlebars';
import { promises as fs } from 'fs';

Handlebars.registerHelper('join', (context, options) => {
    const fn = options.fn;

    return context.map((value) => fn(value, { data: options.data }))
        .join(options.hash.sep);
});

export default async (executor) => {
    const content = await fs.readFile(import.meta.dirname + '/main.md.hbs', 'utf-8');
    const template = Handlebars.compile(content);

    return {
        id: 'markdown',
        extension: 'docx',
        fn: async ({data, workdir}) => {
            await fs.writeFile(workdir + '/output.md', template(data));

            await executor({
                cwd: workdir,
                image: 'docker.io/pandoc/core:edge',
                executable: 'pandoc',
                command: ['./output.md', '-o', 'output.docx']
            });

            return workdir + '/output.docx';
        }
    };
}