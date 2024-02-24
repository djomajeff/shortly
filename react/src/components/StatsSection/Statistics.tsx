import { forwardRef, useContext } from "react";
import {
  brandImage,
  detailedImage,
  fullyCustomImage,
} from "../../utils/images";
import classes from "./Statistics.module.css";
import { LinkContext } from "../../store/link-context";
import ShortenForm from "./Form/ShortenForm";
import ShortenItem from "./ShortenItem/ShortenItem";

const Statistics = forwardRef<HTMLFormElement>((_, ref) => {
  const linkContext = useContext(LinkContext);
  const statsIems = [
    {
      title: "Brand Recognition",
      image: brandImage,
      description:
        "Boost your brand recognition with each click. Generic links don’t mean a thing. Branded links help instil confidence in your content.",
    },
    {
      title: "Detailed Records",
      image: detailedImage,
      description:
        "Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.",
    },
    {
      title: "Fully Customizable",
      image: fullyCustomImage,
      description:
        "Improve brand awareness and content discoverability through customizable links, supercharging audience engagement.",
    },
  ];
  return (
    <section className={classes.statistics}>
      <ShortenForm ref={ref} />
      <ol>
        {linkContext.links.reverse().map((link) => (
          <ShortenItem link={link} key={link.shorten} />
        ))}
      </ol>
      <h1>Advanced Statistics</h1>
      <p>
        Track how your links are performing across the web with our advanced
        statistics dashboard.
      </p>
      <ul className={classes.list}>
        <div className={classes.line}></div>
        {statsIems.map((item, index) => (
          <li>
            <article
              key={index}
              className={classes.item}
              style={{
                marginTop: index === 0 ? "0" : `${index * 30}px`,
              }}
            >
              <div className={classes.circle}>
                <img src={item.image} alt={item.title} />
              </div>
              <h2>{item.title}</h2>
              <p>{item.description}</p>
            </article>
          </li>
        ))}
      </ul>
    </section>
  );
});

export default Statistics;
