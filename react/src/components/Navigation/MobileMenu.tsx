import { FC, useEffect, useRef } from "react";
import { createPortal } from "react-dom";
import classes from "./MobileMenu.module.css";
import { leadingNavItems } from "../utils/constant";
import { NavLink } from "react-router-dom";

export const MobileMenu: FC<{ onClose: VoidFunction }> = ({ onClose }) => {
  const dialog = useRef<HTMLDialogElement>(null);

  useEffect(() => {
    const modal = dialog.current!;
    modal.showModal();

    return () => {
      modal.close();
    };
  }, []);

  function handleClose() {
    dialog.current!.close();
  }

  return createPortal(
    <dialog className={classes.menu} ref={dialog} onClose={onClose}>
      {leadingNavItems.map((item) => (
        <NavLink key={item.path} to={item.path} onClick={handleClose}>
          {item.name}
        </NavLink>
      ))}
      <hr />
      <p onClick={handleClose}>Login</p>
      <button onClick={handleClose}>Sign Up</button>
    </dialog>,
    document.getElementById("menu")!
  );
};
