import { join} from 'path';
import { promises as fs } from 'fs'
import { $ } from 'execa';
import chalk from 'chalk';

const fontFace = /@font-face\((?<url>.*)\)/g

const downloadFonts = (targetDir) => async (url) => {
    const tempFile = join('/tmp/', 'font-face-' + Math.random().toString(36).slice(-6));

    console.log(chalk.grey(`wget -O ${tempFile} ${url}`));

    await $`wget -O ${tempFile} ${url}`

    console.log(chalk.grey(`unzip -d ${targetDir} ${tempFile}`));

    await $`unzip -od ${targetDir} ${tempFile}`
}

export const fetchFonts = async (file, output) => {
    const content = await fs.readFile(file, 'utf-8');

    const matches = [...content.matchAll(fontFace)];

    const urls = matches.map(match => match.groups.url);

    await Promise.all(
        urls.map(downloadFonts(output))
    )
}