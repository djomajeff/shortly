import { FC, useState } from "react";
import classes from "./ShortenItem.module.css";
import { LinkModel } from "../../../models/link.model";

const ShortenItem: FC<{ link: LinkModel }> = ({ link }) => {
  const [isCopied, setIsCopied] = useState(false);
  const [isCopying, setIsCopying] = useState(false);

  async function handleCopy() {
    setIsCopying(true);
    await navigator.clipboard.writeText(link.shorten);
    setIsCopied(true);
    setIsCopying(false);
    setTimeout(() => {
      setIsCopied(false);
    }, 1000 * 3);
  }

  return (
    <li key={link.shorten} className={classes.item}>
      <p>{link.original}</p>
      <span>
        <a href={link.shorten}>{link.shorten}</a>
        {isCopying ? (
          <p>Copying...</p>
        ) : (
          <button
            onClick={handleCopy}
            disabled={isCopied}
            className={isCopied ? classes.copied : undefined}
          >
            {isCopied ? "Copied!" : "Copy"}
          </button>
        )}
      </span>
    </li>
  );
};

export default ShortenItem;
