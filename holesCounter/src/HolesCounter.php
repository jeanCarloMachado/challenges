<?php

class HolesCounter
{
	const ONE_HOLE_LETTERS = "QROPAD";
	const TWO_HOLE_LETTERS = "B";

    public function count($string)
    {
        $result = 0;
        for ($i = 0; $i < strlen($string); $i++) {
            if (preg_match('/'.$string{$i}.'/', self::ONE_HOLE_LETTERS)) {
                $result++;
                continue;
            }
            if (strstr(self::TWO_HOLE_LETTERS, $string{$i})) {
                $result+= 2;
            }
        }
        return $result;
    }
}
