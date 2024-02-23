import { useMutation } from "@tanstack/react-query";
import { FC, useContext, useRef, useState } from "react";
import { Repository } from "../utils/repository";
import { LinkContext } from "../store/link-context";

export const HomePage: FC = () => {
  const linkContext = useContext(LinkContext);
  const inputRef = useRef<HTMLInputElement>(null);
  const [inputError, setInputError] = useState<string | null>(null);

  const { isPending, mutate } = useMutation({
    mutationFn: () => Repository.shortenLink(inputRef.current!.value!),
    onSuccess: (data) => {
      linkContext.addLink(data);
      inputRef.current!.value = "";
    },
    onError: (error) => {
      console.log(error);
    },
  });

  const submitHandler = (event: React.FormEvent) => {
    event.preventDefault();
    const enteredText = inputRef.current?.value;
    if (enteredText?.trim().length === 0) {
      setInputError("Please enter a valid url !");
      console.log("Please enter a valid url !");
      return;
    } else if (inputError != null) {
      setInputError(null);
    }

    mutate();
  };

  const hasError = inputError != null;

  return (
    <div>
      <form onSubmit={submitHandler}>
        <input ref={inputRef} type="text" name="url" id="url" />
        {hasError && <p>{inputError}</p>}
        {isPending && <p>Loading...</p>}
        {!isPending && <button>Shorten</button>}
      </form>
      <ul>
        {linkContext.links.map((link) => (
          <li key={link.shorten}>
            <a href={link.shorten}>{link.shorten}</a>
          </li>
        ))}
      </ul>
    </div>
  );
};
