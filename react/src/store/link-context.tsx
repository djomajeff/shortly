import React, { FC, useEffect, useState } from "react";
import { LinkModel } from "../models/link.model";
import { Repository } from "../utils/repository";

type LinkContextObj = {
  links: LinkModel[];
  addLink: (link: LinkModel) => void;
};

type LinkContextProviderProps = {
  children: React.ReactNode;
};

export const LinkContext = React.createContext<LinkContextObj>({
  links: [],
  addLink: () => {},
});

export const LinkContextProvider: FC<LinkContextProviderProps> = (props) => {
  const [links, setLinks] = useState<LinkModel[]>([]);

  const addLink = (link: LinkModel) => {
    setLinks((prev) => [...prev, link]);
  };

  useEffect(() => {
    const links = Repository.getLocalLinks();
    setLinks(links);
  }, []);

  return (
    <LinkContext.Provider value={{ links, addLink }}>
      {props.children}
    </LinkContext.Provider>
  );
};
