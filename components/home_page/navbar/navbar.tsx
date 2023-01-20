import styles from "./navbar.module.css"

export default function Navbar(){
    return(
        <>
        <head>
            <link rel="stylesheet" href="navbar.module.css" type="text/css" />
        </head>
        <div className={styles.navbar}>
            Navbar
        </div>
        </>
    )
}