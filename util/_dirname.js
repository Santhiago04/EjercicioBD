import { fileURLToPath } from "url";
import path, { join } from "path";

const _filename=fileURLToPath(import.meta.url);
const _dirname = path.dirname(join(_filename,"../"));

export {_dirname};