import styles from "./what_we_do.module.css"

export default function WhatWeDo(){
    return(
        <section>
            <div className={styles.testBox}>
                <section>
                    <div className={styles.testBox3}></div>
                    <div className={styles.testBox4}></div>
                    <div className={styles.testBox3}></div>
                    <div className={styles.testBox4}></div>
                </section>
            </div>
            <div className={styles.testBox2}></div>
        </section>
    )
}