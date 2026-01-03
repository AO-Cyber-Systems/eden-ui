import { env } from "$env/dynamic/private";
import type { LayoutServerLoad } from "./$types";

export const load: LayoutServerLoad = async () => {
  return { FATHOM_ID: env.FATHOM_ID ?? "" };
};
