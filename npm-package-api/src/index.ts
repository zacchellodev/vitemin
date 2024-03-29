import express, { Express } from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'
import asyncHandler from 'express-async-handler'
import puppeteer from 'puppeteer'
import scrappingPackageVersion from './scraper'

(async () => {
  const browser = await puppeteer.launch({ headless: true })
  const page = await browser.newPage()

  const app : Express = express()

  app.use(cors())
  app.use(bodyParser.json())

  app.get("/api/package/version/:packageName", asyncHandler(async (req, res) => {
    const packageName = req.params.packageName

    const packageVersion = await scrappingPackageVersion(page, packageName)

    if (packageVersion) res.send(packageVersion).status(200)
    else res.status(404)
  }))

  app.listen(3000, () => console.log('API is Online!'))
})()
