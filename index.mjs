import templates from "./templates/index.mjs";
import YAML from 'yaml';
import { promises as fs } from 'fs';
import { $ } from 'execa';
import { join } from 'path'; 
import chalk from "chalk";

const { EXECUTOR } = process.env;
const people = await fs.readdir('./people');

const executors = {
    local: ({
        cwd,
        command,
        executable
    }) => { 
        console.log(chalk.grey(`${executable} ${command}`));
        return $({ cwd })`${executable} ${command}`;
    }, 
    podman: ({
        cwd,
        image,
        command,
        executable
    }) => {
        console.log(chalk.white('> ') + chalk.grey(`podman run -w=${cwd} -v ${cwd}:${cwd}:rshared --entrypoint=${executable} ${image} ${command.join(' ')}`));
        return $`podman run -w=${cwd} -v ${cwd}:${cwd}:rshared --entrypoint=${executable} ${image} ${command}`;
    }
}

const templateFunctions = await Promise.all(templates.map((template) => template(executors[EXECUTOR])));

console.log(chalk.green('Loaded template functions [' + templateFunctions.map(it => it.id).join(", ") + ']'));

Promise.all(
    people
        .map(async (file) => {
            const [name] = file.split('.');
            const data = YAML.parse(await fs.readFile('./people/' + file, 'utf-8'));

            return await Promise.all(
                templateFunctions.map(async template => { 
                    const uuid = Math.random().toString(36).slice(-6);
                    const workdir = import.meta.dirname + `/dist/intermediate/${name}-${template.id}-${uuid}`;

                    await fs.mkdir(workdir, { recursive: true });

                    const resultFile = await template.fn({
                        data,
                        workdir
                    })

                    const output = join(import.meta.dirname, '/dist/output');

                    await fs.mkdir(output, { recursive: true });

                    await fs.cp(resultFile, join(output, name + '.' + template.extension));
                })
            )
        })
)