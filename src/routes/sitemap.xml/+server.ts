import * as sitemap from "super-sitemap";
import { error } from "@sveltejs/kit";
import type { RequestHandler } from "@sveltejs/kit";
import * as docs from "./docs";

export const GET: RequestHandler = async () => {
  let docsSlugs;
  try {
    docsSlugs = await docs.getDocsSlugs();
  } catch (err) {
    console.error("Could not load docs data for sitemap:", err);
    throw error(500, "Could not load data for param values.");
  }

  return await sitemap.response({
    origin: "https://eden-ui.dev",
    excludeRoutePatterns: [
      "^/component-data.*",
      "^/docs-examples.*",
      "^/docs/examples.*",
      "^/fonts.*",
      "^/testdir.*",
      "^/layouts/component.*"
    ],
    paramValues: {
      "/docs/pages/[slug]": docsSlugs["pages"] || [],
      "/docs/components/[slug]": docsSlugs["components"] || [],
      "/docs/forms/[slug]": docsSlugs["forms"] || [],
      "/docs/typography/[slug]": docsSlugs["typography"] || [],
      "/docs/utilities/[slug]": docsSlugs["utilities"] || [],
      "/docs/extend/[slug]": docsSlugs["extend"] || [],
      "/docs/plugins/[slug]": docsSlugs["plugins"] || [],
      "/icons/[slug]": docsSlugs["icons"] || []
    }
  });
};
