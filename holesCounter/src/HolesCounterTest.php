<?php

require __DIR__.'/../vendor/autoload.php';
require __DIR__.'/HolesCounter.php';

class HolesCounterTest extends PHPUnit_Framework_TestCase
{
    private $counter;

    const ZERO_HOLES_LETTERS = 'WTYUISFGHJKLZXCVNM';
    const ONE_HOLE_LETTERS = 'QROPAD';
    const TWO_HOLE_LETTERS = 'B';

    public function setup()
    {
        $this->counter = new HolesCounter();
    }
    public function testEmptyStringZeroHoles()
    {
        $this->assertEquals(0, $this->counter->count(''));
    }

    public function testNoEmptyStringZeroHoles()
    {
        $this->assertEquals(0, $this->counter->count(self::ZERO_HOLES_LETTERS));
    }

    public function testOneHoleLetters()
    {
        $this->assertEquals(
            strlen(self::ONE_HOLE_LETTERS),
            $this->counter->count(self::ONE_HOLE_LETTERS)
        );
    }

    public function testTwoHoleLetters()
    {
    	$totalHoles = strlen(self::TWO_HOLE_LETTERS) * 2; 
        $this->assertEquals(
            $totalHoles,
            $this->counter->count(self::TWO_HOLE_LETTERS)
        );
    }

    public function testMultipleSizedLetters()
    {
        $totalHoles = strlen(self::TWO_HOLE_LETTERS) * 2; 
        $totalHoles+= strlen(self::ONE_HOLE_LETTERS); 

        $this->assertEquals(
            $totalHoles,
            $this->counter->count(self::ONE_HOLE_LETTERS.self::TWO_HOLE_LETTERS)
        );
    }
}
