import classes from "./Footer.module.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faFacebook,
  faTwitter,
  faPinterest,
  faInstagram,
} from "@fortawesome/free-brands-svg-icons";

const Footer = () => {
  const footerItems = [
    {
      title: "Features",
      links: ["Link Shortening", "Branded Links", "Analytics"],
    },
    {
      title: "Resources",
      links: ["Blog", "Developers", "Support"],
    },
    {
      title: "Company",
      links: ["About", "Our Team", "Careers", "Contact"],
    },
  ];

  const socialIcons = [faFacebook, faTwitter, faPinterest, faInstagram];

  return (
    <footer id="footer" className={classes.footer}>
      <h2>Shortly</h2>
      {footerItems.map((item, index) => (
        <ul key={index}>
          <h4>{item.title}</h4>
          {item.links.map((link, index) => (
            <a key={index} href="#footer">
              {link}
            </a>
          ))}
        </ul>
      ))}
      <div className={classes.icons}>
        {socialIcons.map((item, index) => (
          <FontAwesomeIcon key={index} icon={item} className={classes.icon} />
        ))}
      </div>
    </footer>
  );
};

export default Footer;
