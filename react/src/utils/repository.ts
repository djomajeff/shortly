/* eslint-disable @typescript-eslint/no-explicit-any */
import { LinkModel } from "../models/link.model";
import { LOCAL_KEY, apiKey } from "./constant";

class Repository {
  public static getLocalLinks(): LinkModel[] {
    const data = localStorage.getItem(LOCAL_KEY);
    return data
      ? (JSON.parse(data) as any[]).map((data) => new LinkModel({ ...data }))
      : [];
  }

  public static async shortenLink(value: string): Promise<LinkModel> {
    const response = await fetch("https://shrtlnk.dev/api/v2/link", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        "api-key": apiKey,
      } as HeadersInit,
      body: JSON.stringify({ url: value }),
    });
    const data = await response.json();

    if (!response.ok) {
      throw new Error(data?.message ?? "Failed to shorten link");
    }

    const link = new LinkModel({ original: value, shorten: data.shrtlnk });
    this.storeLinkToStorage(link);
    return link;
  }

  private static storeLinkToStorage(link: LinkModel) {
    const data = this.getLocalLinks();
    data.push(link);
    localStorage.setItem(LOCAL_KEY, JSON.stringify(data));
  }
}

export { Repository };
