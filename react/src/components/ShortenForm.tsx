import { forwardRef, useContext, useRef, useState } from "react";
import classes from "./ShortenForm.module.css";
import { useMutation } from "@tanstack/react-query";
import { LinkContext } from "../store/link-context";
import { Repository } from "../utils/repository";

const ShortenForm = forwardRef<HTMLFormElement>((_, ref) => {
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
    <form ref={ref} className={classes.form} onSubmit={submitHandler}>
      <div>
        <input
          ref={inputRef}
          type="text"
          placeholder="shorten a link"
          className={hasError ? classes.error : undefined}
        />
        {hasError && <p>{inputError}</p>}
      </div>
      <button disabled={isPending}>
        {isPending ? "Loading..." : "Shorten"}
      </button>
    </form>
  );
});

export default ShortenForm;
