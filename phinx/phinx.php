<?php

require __DIR__ . '/vendor/autoload.php';

$urlParts = parse_url(getenv('DSN'));

$adapter = new \Laminas\Db\Adapter\Adapter([
    'driver' => 'Pdo_Mysql',
    'hostname' => $urlParts['host'],
    'database' => substr($urlParts['path'], 1),
    'username' => $urlParts['user'],
    'password' => $urlParts['pass'],
]);

return [
    'paths' => [
        'migrations' => './phinx/migrations',
        'seeds' => './phinx/seeds'
    ],
    'environments' => [
        'default_migration_table' => 'phinxlog',
        'default_database' => 'l',
        'l' => [
            'name' => $adapter->getDriver()->getConnection()->getCurrentSchema(),
            'connection' => $adapter->getDriver()->getConnection()->getResource(),
        ],
    ],
];
