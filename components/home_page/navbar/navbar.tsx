import styles from "./navbar.module.css"
import Logo from "/public/svgs/logo.svg"
import WhatWeDo from "/public/svgs/navbar/what_we_do.svg"
import WhoWeAre from "/public/svgs/navbar/who_we_are.svg"
import WhyUs from "/public/svgs/navbar/why_us.svg"
import Careers from "/public/svgs/navbar/careers.svg"
import Contact from "/public/svgs/navbar/contact.svg"
import MenuIcon from "/public/svgs/icons/menu.svg"


export default function Navbar(){
    return(
        <div className={styles.banner}>
            <section className={styles.navbar}>
                <div className={styles.navItem}>
                    <Logo ></Logo>
                </div>
                <WhatWeDo className={styles.test}></WhatWeDo>
                <WhoWeAre className={styles.test}></WhoWeAre>
                <WhyUs className={styles.test}></WhyUs>
                <Careers className={styles.test}></Careers>
                <Contact className={styles.test}></Contact>
                <MenuIcon className={styles.navItem}></MenuIcon>
            </section>



            {/* <section className={styles.navbar}>
                <Logo className={styles.navItem}></Logo>
                <WhatWeDo className={styles.test}></WhatWeDo>
                <WhoWeAre className={styles.test}></WhoWeAre>
                <WhyUs className={styles.test}></WhyUs>
                <Careers className={styles.test}></Careers>
                <Contact className={styles.test}></Contact>
                <MenuIcon className={styles.navItem}></MenuIcon>
            </section> */}
        </div>
    )
}