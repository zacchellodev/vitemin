import { Page } from "puppeteer"

const scrappingPackageVersion = async (page: Page, packageName: string) => {
  try {
    await page.goto(`https://www.npmjs.com/package/${packageName}`)
    const version = await page.$eval('.abe380b3 p', el => el.textContent)
    return version
  } catch (err) {
    console.log(err)
    return null
  }
}

export default scrappingPackageVersion
