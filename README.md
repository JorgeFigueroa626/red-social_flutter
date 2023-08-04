# red_social

A new Flutter project.

# Prerequisites

- Place the url of your API [https://API/](https://*API*/)

- In the class `\red_social\lib\helpers\appconstants.dart` 
  ````
  const BASE_URL = 'http://API/';
  const API_URL = "${BASE_URL}api/";
  const LOGIN_URL = "${API_URL}login";
  const REGISTER_URL = "${API_URL}register";
  const POST_URL = "${API_URL}public/post";
  const CREATE_URL = "${API_URL}post/create";
  const CAT_URL = "${API_URL}category/all";
  const CAT_BY_URL = "${API_URL}public/post/category?category_id=";
  const PROFILE_URL = "${API_URL}login/user";
  const USER_POST_URL = "${API_URL}user/post";
  const IMG_BASE_URL = "${BASE_URL}public";
  ````

# Screenshots

| Posts Dashboard                                |New Posts Panel                          | Profile panel                                     |Registration panel                                     |
|-------------------------------------------------|-------------------------------------------------|-------------------------------------------------|-------------------------------------------------|
| <img src="https://github.com/JorgeFigueroa626/red-social_flutter/blob/main/assents/post.png" height="520"> | <img src="https://github.com/JorgeFigueroa626/red-social_flutter/blob/main/assents/newPost.png" height="520"> | <img src="https://github.com/JorgeFigueroa626/red-social_flutter/blob/main/assents/profile.png" height="520"> | <img src="https://github.com/JorgeFigueroa626/red-social_flutter/blob/main/assents/registerUser.png" height="520"> |
