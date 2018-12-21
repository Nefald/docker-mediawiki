<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit89276f11a7e27dbdee8974004a3654a8
{
    public static $prefixLengthsPsr4 = array (
        'C' => 
        array (
            'Composer\\Installers\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Composer\\Installers\\' => 
        array (
            0 => __DIR__ . '/..' . '/composer/installers/src/Composer/Installers',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit89276f11a7e27dbdee8974004a3654a8::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit89276f11a7e27dbdee8974004a3654a8::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
