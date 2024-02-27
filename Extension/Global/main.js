
// FOR WEB SCRAPPER
chrome.tabs.query({active: true, lastFocusedWindow: true}, tabs => {
    var title = tabs[0].title;
    var url_fetch = tabs[0].url;
    var content = tabs[0].source;
    // console.log(tabs);
    // FOR COOKIES
    chrome.cookies.getAll({url: url_fetch}, function(cookies) {
      allCookies = cookies;
      var str="";
      for (let i = 0, len = allCookies.length, text = ""; i < len; i++) {
        console.log(allCookies[i]);
        j=i+1;
        str= str + "<tr><td>"+j+"</td><td>"+allCookies[i].domain+"</td><td>"+allCookies[i].name+"</td><td>"+allCookies[i].expirationDate+"</td><td><button style='color:white; background: red; border:1px solid red;'>Delete</button></td></tr>";

      }
      document.getElementById("cookies_value").innerHTML =str;


    });

    var selector = document.documentElement;
    chrome.scripting.executeScript({
        target: { tabId :tabs[0].id },
        files: ["main2.js"],
      })
      .then(() => {
        // document.getElementById("site_name").innerHTML =url_fetch;
      });

    chrome.runtime.onMessage.addListener((response, sender, sendResponse) => {
        url=response['url'];
        scrape_data=response['scrape_data'];
        cookies=response['cookie'];
        // console.log(cookies);
        // var cookies_array = cookies.split(";");
        // for (let i = 0; i < cookies_array.length; i++){
        //     console.log(cookies_array[i]);
        //     console.log("");
        // }
        data={url:url,scrape_data:scrape_data,cookies:cookies}
        var formData = new FormData();
        for (var key in data) {
        formData.append(key, data[key]);

        }
        // var url1 = "https://sharktooth.ecomlancers.com/Api/data_collect";
        // fetch(url1, {
        // method: 'POST',
        // headers: {
        //     'Access-Control-Allow-Origin': '*'
        // },
        // body: formData
        // }).then(response => response.json()).then(data => {
        //     // alert(11111);
        // });
    });
  });

// FOR COOKIE ANALYSIS