<?php
require_once("connect.php");

function sliderInfo() {
  $s = sql("select DISTINCT
      s.id, 
      s.`name_app`, 
      s.`price`, 
      s.`discount`, 
      s.logo,
      GROUP_CONCAT(DISTINCT p.`name_tag` SEPARATOR ', ') AS name_tags,
      GROUP_CONCAT(DISTINCT sc.`img` SEPARATOR ', ') AS imgs
    from 
      slides s 
        left join platforms p ON p.slide_id = s.id 
        left join screenshots sc ON sc.slide_id = s.id
      group by s.id;");

  $slides = array_map(function($item) {
    $listImg = [];
    if ($item['imgs'] !== NULL) { 
      $listImg = explode(',', $item['imgs']);
    }

    $listPlatforms = [];
    if ($item['name_tags'] !== NULL) {
      $listPlatforms = explode(',', $item['name_tags']);
    }


    return [
      'title' => $item['name_app'],
      'access' => 'Доступность игры',
      'platforms' => $listPlatforms,
      'price' => [
        'discount' => $item['discount'],
        'price' => $item['price'],
      ],
      'screenshots' => [
        'main' => $item['logo'],
        'list' => $listImg,
      ],
    ];
  }, $s['result_assoc']);

  echo json_encode([
      'slides' => $slides
  ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

switch ($_GET['api']) {
  case 'sliderInfo':
    sliderInfo();
    break;
  
  default:
    echo '{}';
    break;
}

?>