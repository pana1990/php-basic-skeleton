<?php

namespace Tests;

use App\HelloWorld;
use PHPUnit\Framework\TestCase;

final class HelloWorldTest extends TestCase
{
    public function testHi(): void
    {
        $this->assertEquals('hi', HelloWorld::hi());
    }
}
