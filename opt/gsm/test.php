<?php

function get_ip($interface) {
  $interface = escapeshellarg($interface);
  $pattern = "/inet addr:(\d+\.\d+\.\d+\.\d+)/";
  $text = shell_exec("ifconfig $internface");
  preg_match($pattern, $text, $matches);
  return $matches[1];
}

get_ip("wlan0");
?>
