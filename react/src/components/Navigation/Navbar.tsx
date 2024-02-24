import { NavLink } from "react-router-dom";
import classes from "./Navbar.module.css";
import { logoImage } from "../../utils/images";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars } from "@fortawesome/free-solid-svg-icons";
import { leadingNavItems } from "../../utils/constant";
import { useState } from "react";
import { MobileMenu } from "./MobileMenu";

const Navbar = () => {
  const [menuIsOpen, setMenuIsOpen] = useState(false);

  function handleOpenMenu() {
    setMenuIsOpen(true);
  }

  function handleCloseMenu() {
    setMenuIsOpen(false);
  }

  return (
    <header className={classes.header}>
      <>
        {menuIsOpen && <MobileMenu onClose={handleCloseMenu} />}
        <nav>
          <ul className={classes.list}>
            <h2>Shortly</h2>
            {leadingNavItems.map((item) => (
              <li key={item.path}>
                <NavLink
                  to={item.path}
                  className={({ isActive }) =>
                    isActive ? classes.active : undefined
                  }
                >
                  {item.name}
                </NavLink>
              </li>
            ))}
          </ul>
        </nav>
        <div className={classes.actions}>
          <button className={classes["text-button"]}>Login</button>
          <button>Sign Up</button>
        </div>
      </>
      <>
        <img src={logoImage} alt="Logo image" className={classes.visibility} />
        <FontAwesomeIcon
          icon={faBars}
          size="2x"
          color="gray"
          className={classes.visibility}
          onClick={handleOpenMenu}
        />
      </>
    </header>
  );
};

export default Navbar;
