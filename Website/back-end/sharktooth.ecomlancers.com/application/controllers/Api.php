<?php 
class Api extends CI_Controller 
{
    public function site_check(){
        echo json_encode(array("message"=>"Dark pattern Detected",'patterns'=>array('Ends in 05h 25m 00s','M.R.P.: <del>₹1,999</del>','-55%'),'status'=>200));

    }
    public function data_collect()
    {
        $url=$this->input->post('url');
        $scrape_data=$this->input->post('scrape_data');
        $scrape_data=htmlentities(htmlspecialchars($scrape_data));
        $cookies=$this->input->post('cookies');
        $date=date("Y-m-d h:i:s");
        $base_url=base_url($url);
        $query=$this->db->query("INSERT INTO site_surfed(url,base_url,scraped_data,cookies,date_added) VALUES('$url','$base_url','$scrape_data','$cookies','$date')");
        // $data=array('url'=>$url,'scrape_data'=>$scrape_data);
        // $data=array('dark_pattern_count'=>'10','dark_pattern'=>array('Ends in 05h 25m 00s','M.R.P.: <del>₹1,999</del>','-55%'));
        // $data=json_encode($data);
        // echo $data;
        // $json_data = '{"results": [{"dark_pattern_detection": {"has_dark_pattern": true,"total_dark_pattern_count": 3,"detected_dark_patterns": [{"pattern_type": "Misdirection","details": "The website uses misdirection to trick users into taking unintended actions."},{"pattern_type": "Hidden Costs","details": "There are hidden costs not clearly disclosed to the user."},{"pattern_type": "Aggressive Upselling","details": "The website aggressively pushes unnecessary upsells to the user."}]},}]}';
        echo 1111;
        // TO ANALYZE DATA AND FIND DARK PATTERNS
        
    }

    public function data_fetch()
    {
        $query=$this->db->query("SELECT * FROM site_surfed");
        $query=$query->result();
        print_r(json_encode($query));
    }

    public function mobile_api1()
    {
        echo '[
    {
      "tw-table__rank": 1,
      "app-favicon src": "https://site-images.similarcdn.com/image?url=amazon.com&t=2&s=1&h=25d18f99c7a0c5d99df60d68a5d1b69a04656b6c6a0ebc4a843786168ad21b3f",
      "tw-table__domain": "amazon.com",
      "tw-table__category": "eCommerce & Shopping > Marketplace",
      "tw-table__category href": "https://www.similarweb.com/top-websites/e-commerce-and-shopping/marketplace/",
      "app-parameter-change": "=",
      "tw-table__avg-visit-duration": "00:06:15",
      "tw-table__pages-per-visit": 11.89,
      "tw-table__bounce-rate": "26.48%"
    },
    {
      "tw-table__rank": 2,
      "app-favicon src": "https://site-images.similarcdn.com/image?url=youtube.com&t=2&s=1&h=d47db61e67f022a066fbc3a7a30cbcf2f7d58e1ef68a3d20eb4a6e99204f8d89",
      "tw-table__domain": "youtube.com",
      "tw-table__category": "Arts & Entertainment > TV Movies and Streaming",
      "tw-table__category href": "https://www.similarweb.com/top-websites/arts-and-entertainment/tv-movies-and-streaming/",
      "app-parameter-change": "=",
      "tw-table__avg-visit-duration": "00:21:53",
      "tw-table__pages-per-visit": 4.17,
      "tw-table__bounce-rate": "33.45%"
    },
    {
      "tw-table__rank": 3,
      "app-favicon src": "https://site-images.similarcdn.com/image?url=instagram.com&t=2&s=1&h=dc39f4290157b3458c431e4f478175c69bfeea4824016b77c78c8d53506e1e1d",
      "tw-table__domain": "instagram.com",
      "tw-table__category": "Social Networking",
      "tw-table__category href": "https://www.similarweb.com/top-websites/social-networking/",
      "app-parameter-change": "=",
      "tw-table__avg-visit-duration": "00:05:29",
      "tw-table__pages-per-visit": 5.03,
      "tw-table__bounce-rate": "38.27%"
    },
    {
      "tw-table__rank": 4,
      "app-favicon src": "https://site-images.similarcdn.com/image?url=twitter.com&t=2&s=1&h=43cc51d8f60d144cb3e271a9b3c2959823082e08a26e0e4a2a86c600e81d22ac",
      "tw-table__domain": "twitter.com",
      "tw-table__category": "Social Networking",
      "tw-table__category href": "https://www.similarweb.com/top-websites/social-networking/",
      "app-parameter-change": "=",
      "tw-table__avg-visit-duration": "00:04:40",
      "tw-table__pages-per-visit": 5.87,
      "tw-table__bounce-rate": "38.49%"
    },  
  {
    "tw-table__rank": 5,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=baidu.com&t=2&s=1&h=178228b3c52f0d8b0cb0b138670cccb41d21f5ff03551da7375a97012005daa7",
    "tw-table__domain": "baidu.com",
    "tw-table__category": "Computers Electronics and Technology > Search Engines",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/search-engines/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:04:32",
    "tw-table__pages-per-visit": 7.86,
    "tw-table__bounce-rate": "22.93%"
  },
  {
    "tw-table__rank": 6,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=wikipedia.org&t=2&s=1&h=460eb7e23fbc3666abf9d8b5497c3ca33d1de8ff9c66dd5d182c7633fe475c61",
    "tw-table__domain": "wikipedia.org",
    "tw-table__category": "Reference Materials > Dictionaries and Encyclopedias",
    "tw-table__category href": "https://www.similarweb.com/top-websites/reference-materials/dictionaries-and-encyclopedias/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:03:59",
    "tw-table__pages-per-visit": 3.18,
    "tw-table__bounce-rate": "58.99%"
  },
  {
    "tw-table__rank": 7,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=yahoo.com&t=2&s=1&h=a135e030f99f8070348f49e9e1879c9093cdb33ad6b658fa2593fed09fa6060e",
    "tw-table__domain": "yahoo.com",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:08:47",
    "tw-table__pages-per-visit": 5.61,
    "tw-table__bounce-rate": "33.47%"
  },
  {
    "tw-table__rank": 8,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=yandex.ru&t=2&s=1&h=f0674e5e56f12160a4f31738b3aecd42e2ebffde994db0c5ebdd214ef6dde60e",
    "tw-table__domain": "yandex.ru",
    "tw-table__category": "Computers Electronics and Technology > Search Engines",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/search-engines/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:08:55",
    "tw-table__pages-per-visit": 8.77,
    "tw-table__bounce-rate": "25.44%"
  },
  {
    "tw-table__rank": 9,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=whatsapp.com&t=2&s=1&h=d766df2c2537e7a216389c9fbc4118d24ceca7fd169c78048289caab483ba581",
    "tw-table__domain": "whatsapp.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:20:17",
    "tw-table__pages-per-visit": 1.72,
    "tw-table__bounce-rate": "40.13%"
  },
  {
    "tw-table__rank": 10,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=xvideos.com&t=2&s=1&h=f5d29d9ed79e14cfc8033f2eb7d9290f977f74104155880926ae289e214c3fd2",
    "tw-table__domain": "xvideos.com",
    "tw-table__category": "Adult",
    "tw-table__category href": "https://www.similarweb.com/top-websites/adult/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:08:40",
    "tw-table__pages-per-visit": 8.96,
    "tw-table__bounce-rate": "17.74%"
  },
  {
    "tw-table__rank": 11,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=amazon.com&t=2&s=1&h=43a07f575342a8fbb74cd3ca3ebf33760f2fbfbff603546fb4f7208244147dcc",
    "tw-table__domain": "amazon.com",
    "tw-table__category": "eCommerce & Shopping > Marketplace",
    "tw-table__category href": "https://www.similarweb.com/top-websites/e-commerce-and-shopping/marketplace/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:06:55",
    "tw-table__pages-per-visit": 9.47,
    "tw-table__bounce-rate": "34.8%"
  },
  {
    "tw-table__rank": 12,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=tiktok.com&t=2&s=1&h=398f47f8e1724c54f9f760f76988b2f9cf0c4111523f9d3f26e03d62731b0c17",
    "tw-table__domain": "tiktok.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:03:27",
    "tw-table__pages-per-visit": 6.73,
    "tw-table__bounce-rate": "36.15%"
  },
  {
    "tw-table__rank": 14,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=pornhub.com&t=2&s=1&h=a7cd82dfb7084774816cabbe511a6b4b7a4f6b6bb484a76d3a4b7c63e66cdebb",
    "tw-table__domain": "pornhub.com",
    "tw-table__category": "Adult",
    "tw-table__category href": "https://www.similarweb.com/top-websites/adult/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:09:20",
    "tw-table__pages-per-visit": 8.2,
    "tw-table__bounce-rate": "22.27%"
  },
  {
    "tw-table__rank": 15,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=xnxx.com&t=2&s=1&h=83f7124390efdbd049ae2139a52591e3767a84e0ac3a812b5214a2fcc1cc4070",
    "tw-table__domain": "xnxx.com",
    "tw-table__category": "Adult",
    "tw-table__category href": "https://www.similarweb.com/top-websites/adult/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:08:04",
    "tw-table__pages-per-visit": 11.2,
    "tw-table__bounce-rate": "12.11%"
  },
  {
    "tw-table__rank": 16,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=reddit.com&t=2&s=1&h=66f2412047e0362ec60d5583d4b186511a8e859446bb112c60d22968facae906",
    "tw-table__domain": "reddit.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:07:46",
    "tw-table__pages-per-visit": 5.81,
    "tw-table__bounce-rate": "42.34%"
  },
  {
    "tw-table__rank": 17,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=yahoo.co.jp&t=2&s=1&h=009b21944c61439f0bec7afd2e150470de636fa4d2b2cee4804e537911a0e7fc",
    "tw-table__domain": "yahoo.co.jp",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:09:09",
    "tw-table__pages-per-visit": 6.26,
    "tw-table__bounce-rate": "31.21%"
  },
  {
    "tw-table__rank": 18,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=live.com&t=2&s=1&h=4f68d3ffc8947028c823ba7e44ba3467cd07f113e6cbf03281186fb2ff9369d2",
    "tw-table__domain": "live.com",
    "tw-table__category": "Computers Electronics and Technology > Email",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/email/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:08:11",
    "tw-table__pages-per-visit": 8.2,
    "tw-table__bounce-rate": "21.38%"
  },
  {
    "tw-table__rank": 19,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=docomo.ne.jp&t=2&s=1&h=16a87fc9a45cb81edf2e6ba66104b6480c2f443bb36d5ed521eb5935c1d45f53",
    "tw-table__domain": "docomo.ne.jp",
    "tw-table__category": "Computers Electronics and Technology > Telecommunications",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/telecommunications/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:05:59",
    "tw-table__pages-per-visit": 4.77,
    "tw-table__bounce-rate": "27.18%"
  },
  {
    "tw-table__rank": 20,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=linkedin.com&t=2&s=1&h=64a0e043fc8ff74ac308e3f0e136ae7d1b6544be4e9e704ad7fd062070be48a1",
    "tw-table__domain": "linkedin.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:07:43",
    "tw-table__pages-per-visit": 7.99,
    "tw-table__bounce-rate": "25.17%"
  },
  {
    "tw-table__rank": 21,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=netflix.com&t=2&s=1&h=68a2885c7960ece3b1d7dd9b592e7ad1b35ddeb89fc89650435c1507f3f1c0b3",
    "tw-table__domain": "netflix.com",
    "tw-table__category": "Arts & Entertainment > Streaming & Online TV",
    "tw-table__category href": "https://www.similarweb.com/top-websites/arts-and-entertainment/tv-movies-and-streaming/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:07:19",
    "tw-table__pages-per-visit": 4.27,
    "tw-table__bounce-rate": "38.8%"
  },
  {
    "tw-table__rank": 22,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=openai.com&t=2&s=1&h=2e9ae820de5f71b75c263fb8b396891383bdd6172185a3db509f79decb5023dc",
    "tw-table__domain": "openai.com",
    "tw-table__category": "Computers Electronics and Technology > Computers Electronics and Technology - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/computers-electronics-and-technology/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:05:03",
    "tw-table__pages-per-visit": 4,
    "tw-table__bounce-rate": "34.84%"
  },
  {
    "tw-table__rank": 23,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=office.com&t=2&s=1&h=c320c9bba8706c784b863ecf11b87fe62249f94477c3fc4a3787b119bc4d9db9",
    "tw-table__domain": "office.com",
    "tw-table__category": "Computers Electronics and Technology > Programming and Developer Software",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/programming-and-developer-software/",
    "app-parameter-change": 2,
    "tw-table__avg-visit-duration": "00:10:21",
    "tw-table__pages-per-visit": 7.92,
    "tw-table__bounce-rate": "28.1%"
  },
  {
    "tw-table__rank": 24,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=dzen.ru&t=2&s=1&h=76e674010f5f1d4ba0f2d8749e9402436d316a06483f5e583234a3df27fc1291",
    "tw-table__domain": "dzen.ru",
    "tw-table__category": "Community and Society > Community and Society - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/community-and-society/community-and-society/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:09:39",
    "tw-table__pages-per-visit": 4.68,
    "tw-table__bounce-rate": "37.63%"
  },
  {
    "tw-table__rank": 25,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=bing.com&t=2&s=1&h=a37ae326ae78ba2da30e9c8da030e84e07d4c76c5452c239f85c9050781ffde8",
    "tw-table__domain": "bing.com",
    "tw-table__category": "Computers Electronics and Technology > Search Engines",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/search-engines/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:07:00",
    "tw-table__pages-per-visit": 5.98,
    "tw-table__bounce-rate": "31.64%"
  },
  {
    "tw-table__rank": 26,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=xhamster.com&t=2&s=1&h=52f199cf7134b108239b1e5dcd4503fbc1a48d8f2fd45ef8610ec0c5ac0c8b00",
    "tw-table__domain": "xhamster.com",
    "tw-table__category": "Adult",
    "tw-table__category href": "https://www.similarweb.com/top-websites/adult/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:07:41",
    "tw-table__pages-per-visit": 6.47,
    "tw-table__bounce-rate": "21.72%"
  },
  {
    "tw-table__rank": 27,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=samsung.com&t=2&s=1&h=acbcd0840863d87073a9c8b029e1f766fd1432cf4d709b92c86a0490904c5c0d",
    "tw-table__domain": "samsung.com",
    "tw-table__category": "Computers Electronics and Technology > Consumer Electronics",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/consumer-electronics/",
    "app-parameter-change": 6,
    "tw-table__avg-visit-duration": "00:02:41",
    "tw-table__pages-per-visit": 2.59,
    "tw-table__bounce-rate": "52.72%"
  },
  {
    "tw-table__rank": 28,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=microsoftonline.com&t=2&s=1&h=9b3ce90d85cdd9b1437910383a87ef98af7c2d1ecfb7d9736ee6d99aa65c01e3",
    "tw-table__domain": "microsoftonline.com",
    "tw-table__category": "Computers Electronics and Technology > Programming and Developer Software",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/programming-and-developer-software/",
    "app-parameter-change": 8,
    "tw-table__avg-visit-duration": "00:02:11",
    "tw-table__pages-per-visit": 2.65,
    "tw-table__bounce-rate": "39.63%"
  },
  {
    "tw-table__rank": 29,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=naver.com&t=2&s=1&h=d0cb2a7c7e5048fcae43abc238269736c1eaae31a8f89160c5be0080115448fc",
    "tw-table__domain": "naver.com",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:17:06",
    "tw-table__pages-per-visit": 11.8,
    "tw-table__bounce-rate": "24.74%"
  },
  {
    "tw-table__rank": 30,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=vk.com&t=2&s=1&h=96c7d9c0167ed93f1aba87c7ec931f6e76e122c08d08cbf046db42369bac906e",
    "tw-table__domain": "vk.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": 2,
    "tw-table__avg-visit-duration": "00:11:34",
    "tw-table__pages-per-visit": 13.34,
    "tw-table__bounce-rate": "28.9%"
  },
  {
    "tw-table__rank": 31,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=bilibili.com&t=2&s=1&h=1a9d57d94f62bc96ce60b3f2440e9cfe1431dd4c1aeca128d063298eedea3382",
    "tw-table__domain": "bilibili.com",
    "tw-table__category": "Arts & Entertainment > Animation and Comics",
    "tw-table__category href": "https://www.similarweb.com/top-websites/arts-and-entertainment/animation-and-comics/",
    "app-parameter-change": 4,
    "tw-table__avg-visit-duration": "00:21:16",
    "tw-table__pages-per-visit": 13.06,
    "tw-table__bounce-rate": "14.02%"
  },
  {
    "tw-table__rank": 32,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=pinterest.com&t=2&s=1&h=ec976160ca16242c6ab9ed7bc48e7b0f04c4100ceac5bcb6d3ea55450aa12210",
    "tw-table__domain": "pinterest.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:05:57",
    "tw-table__pages-per-visit": 6.1,
    "tw-table__bounce-rate": "40.96%"
  },
  {
    "tw-table__rank": 33,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=mail.ru&t=2&s=1&h=0449e16df76ff278543768e084e7d6633e3ac66f98e13696ffcd4e1d25a51851",
    "tw-table__domain": "mail.ru",
    "tw-table__category": "Computers Electronics and Technology > Email",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/email/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:07:59",
    "tw-table__pages-per-visit": 6.03,
    "tw-table__bounce-rate": "32.15%"
  },
  {
    "tw-table__rank": 34,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=turbopages.org&t=2&s=1&h=eb1aaf99c62734c0fbc178c86066bb049e072d0386a106215057174afc1ce8c6",
    "tw-table__domain": "turbopages.org",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:01:29",
    "tw-table__pages-per-visit": 3.32,
    "tw-table__bounce-rate": "22.82%"
  },
  {
    "tw-table__rank": 35,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=discord.com&t=2&s=1&h=133c0aed0b1b6c3760db4875f51accd42ff1157854dd0ee0eabab700af80a348",
    "tw-table__domain": "discord.com",
    "tw-table__category": "Computers Electronics and Technology > Social Media Networks",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/social-networks-and-online-communities/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:06:50",
    "tw-table__pages-per-visit": 7.28,
    "tw-table__bounce-rate": "50.9%"
  },
  {
    "tw-table__rank": 36,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=weather.com&t=2&s=1&h=4211c15438cff54a25f9d9ee48f05a68bd36ddd7ffacdf93e3449739797bb3cb",
    "tw-table__domain": "weather.com",
    "tw-table__category": "Science and Education > Weather",
    "tw-table__category href": "https://www.similarweb.com/top-websites/science-and-education/weather/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:01:03",
    "tw-table__pages-per-visit": 1.95,
    "tw-table__bounce-rate": "39.32%"
  },
  {
    "tw-table__rank": 37,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=microsoft.com&t=2&s=1&h=47a418caa42749a0e924f26be103fa62a0ddf9cec8ef2c315a29ea3dbe296fbc",
    "tw-table__domain": "microsoft.com",
    "tw-table__category": "Computers Electronics and Technology > Programming and Developer Software",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/programming-and-developer-software/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:04:01",
    "tw-table__pages-per-visit": 3.44,
    "tw-table__bounce-rate": "49.21%"
  },
  {
    "tw-table__rank": 38,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=max.com&t=2&s=1&h=ae8a407d9f60e22c1bf0bbbfb9f972350e0d15858da9903bfbc5c7c142f0683d",
    "tw-table__domain": "max.com",
    "tw-table__category": "Arts & Entertainment > Streaming & Online TV",
    "tw-table__category href": "https://www.similarweb.com/top-websites/arts-and-entertainment/tv-movies-and-streaming/",
    "app-parameter-change": 7,
    "tw-table__avg-visit-duration": "00:06:57",
    "tw-table__pages-per-visit": 5.93,
    "tw-table__bounce-rate": "35.76%"
  },
  {
    "tw-table__rank": 39,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=twitch.tv&t=2&s=1&h=355e363b41e14a959cda6ccf0989ff8444402dd8844820c31b74a89bf3ed2792",
    "tw-table__domain": "twitch.tv",
    "tw-table__category": "Games > Video Games Consoles and Accessories",
    "tw-table__category href": "https://www.similarweb.com/top-websites/games/video-games-consoles-and-accessories/",
    "app-parameter-change": 4,
    "tw-table__avg-visit-duration": "00:09:35",
    "tw-table__pages-per-visit": 4.13,
    "tw-table__bounce-rate": "28.55%"
  },
  {
    "tw-table__rank": 40,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=t.me&t=2&s=1&h=3151265a64fa94112029f3e81d07655b605dd870fad655049a47e0f89cb877cc",
    "tw-table__domain": "t.me",
    "tw-table__category": "Computers Electronics and Technology > Computers Electronics and Technology - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/computers-electronics-and-technology/",
    "app-parameter-change": "=",
    "tw-table__avg-visit-duration": "00:02:56",
    "tw-table__pages-per-visit": 2.41,
    "tw-table__bounce-rate": "62.67%"
  },
  {
    "tw-table__rank": 41,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=quora.com&t=2&s=1&h=2292ee60dfa24a38b0f960b7755fce61c1f7ba685f4f9290b129e2e180491c12",
    "tw-table__domain": "quora.com",
    "tw-table__category": "Reference Materials > Dictionaries and Encyclopedias",
    "tw-table__category href": "https://www.similarweb.com/top-websites/reference-materials/dictionaries-and-encyclopedias/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:02:39",
    "tw-table__pages-per-visit": 2.27,
    "tw-table__bounce-rate": "62.4%"
  },
  {
    "tw-table__rank": 42,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=xhamster.desi&t=2&s=1&h=f8ed003ac651d5673027a9677294cbd3ce07666c012aff15c06ae2c3907b70c8",
    "tw-table__domain": "xhamster.desi",
    "tw-table__category": "Adult",
    "tw-table__category href": "https://www.similarweb.com/top-websites/adult/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:03:30",
    "tw-table__pages-per-visit": 3.25,
    "tw-table__bounce-rate": "13.52%"
  },
  {
    "tw-table__rank": 43,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=qq.com&t=2&s=1&h=2bcce8b878b3521d8c830783a6dfa0697cd2da2b96ca7ec88ba8fbd837e01d7b",
    "tw-table__domain": "qq.com",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:03:32",
    "tw-table__pages-per-visit": 4.17,
    "tw-table__bounce-rate": "47.27%"
  },
  {
    "tw-table__rank": 44,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=duckduckgo.com&t=2&s=1&h=dff2821cfcef1d36cdbbf5a78aa7eac7d5da8ef335fa460cfd2cc6180c60aa2a",
    "tw-table__domain": "duckduckgo.com",
    "tw-table__category": "Computers Electronics and Technology > Search Engines",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/search-engines/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:08:49",
    "tw-table__pages-per-visit": 7.16,
    "tw-table__bounce-rate": "11.13%"
  },
  {
    "tw-table__rank": 45,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=fandom.com&t=2&s=1&h=285c419cea12e9eca78123e80a368fd3a390e10303a3c4ffb70447e980df3212",
    "tw-table__domain": "fandom.com",
    "tw-table__category": "Arts & Entertainment > Arts and Entertainment - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/arts-and-entertainment/arts-and-entertainment/",
    "app-parameter-change": 3,
    "tw-table__avg-visit-duration": "00:05:12",
    "tw-table__pages-per-visit": 4.61,
    "tw-table__bounce-rate": "48.33%"
  },
  {
    "tw-table__rank": 46,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=zoom.us&t=2&s=1&h=8d7b62ea2a4830de4939cf04e4b067a49a8b4b203528c8cc3dc73a4a92f6efdb",
    "tw-table__domain": "zoom.us",
    "tw-table__category": "Computers Electronics and Technology > Computers Electronics and Technology - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/computers-electronics-and-technology/",
    "app-parameter-change": 5,
    "tw-table__avg-visit-duration": "00:03:49",
    "tw-table__pages-per-visit": 3.14,
    "tw-table__bounce-rate": "34.24%"
  },
  {
    "tw-table__rank": 47,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=globo.com&t=2&s=1&h=d43aa75cabc939383c66271b0de2de1cce20a20180a27cb130bf5d699031211e",
    "tw-table__domain": "globo.com",
    "tw-table__category": "News & Media Publishers",
    "tw-table__category href": "https://www.similarweb.com/top-websites/news-and-media/",
    "app-parameter-change": 2,
    "tw-table__avg-visit-duration": "00:04:09",
    "tw-table__pages-per-visit": 2.52,
    "tw-table__bounce-rate": "46.4%"
  },
  {
    "tw-table__rank": 48,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=ebay.com&t=2&s=1&h=7f6f9f419ebf2319e686381f48e1ea1bbb2f25fc404930fdfbb3a60985cb6695",
    "tw-table__domain": "ebay.com",
    "tw-table__category": "eCommerce & Shopping > Marketplace",
    "tw-table__category href": "https://www.similarweb.com/top-websites/e-commerce-and-shopping/marketplace/",
    "app-parameter-change": 1,
    "tw-table__avg-visit-duration": "00:06:53",
    "tw-table__pages-per-visit": 6.88,
    "tw-table__bounce-rate": "37.81%"
  },
  {
    "tw-table__rank": 49,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=sharepoint.com&t=2&s=1&h=e80016f238bd5f77055653d82e17e9736e20e1a4382bd030ad60eb02cee57358",
    "tw-table__domain": "sharepoint.com",
    "tw-table__category": "Computers Electronics and Technology > Computers Electronics and Technology - Other",
    "tw-table__category href": "https://www.similarweb.com/top-websites/computers-electronics-and-technology/computers-electronics-and-technology/",
    "app-parameter-change": 7,
    "tw-table__avg-visit-duration": "00:07:53",
    "tw-table__pages-per-visit": 5.95,
    "tw-table__bounce-rate": "29.32%"
  },
  {
    "tw-table__rank": 50,
    "app-favicon src": "https://site-images.similarcdn.com/image?url=roblox.com&t=2&s=1&h=25fffffefa6ca95ed540e8a090f7fb9ecd4a54187105a3b15c3cc761ba04d90c",
    "tw-table__domain": "roblox.com",
    "tw-table__category": "Games > Video Games Consoles and Accessories",
    "tw-table__category href": "https://www.similarweb.com/top-websites/games/video-games-consoles-and-accessories/",
    "app-parameter-change": 5,
    "tw-table__avg-visit-duration": "00:12:45",
    "tw-table__pages-per-visit": 8.71,
    "tw-table__bounce-rate": "20.67%"
  }
]';
    }
}

?>