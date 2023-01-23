import styles from "./navbar.module.css"
import Logo from "/public/svgs/icons/menu.svg"


export default function Navbar(){
    return(
        <div className={styles.banner}>
            <section className={styles.navbar}>
                <img src="/svgs/logo_white.svg" alt="Logo" className={styles.navbarItem} />
                <Logo className={styles.navbarItem}></Logo>
            </section>
        </div>
    )
}