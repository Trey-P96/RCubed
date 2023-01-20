import Head from 'next/head'
import Image from 'next/image'
import { Inter } from '@next/font/google'
import styles from '@/styles/Home.module.css'
import Navbar from '../components/home_page/navbar/navbar'
import WhatWeDo from '@/components/home_page/what_we_do/what_we_do'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <>
      <Head>
        <title>R-Cubed Consulting</title>
        <meta name="description" content="Relationships Results Reputation" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
        <Navbar></Navbar>
        <main>
          <WhatWeDo></WhatWeDo>
        </main>
      
    </>
  )
}
