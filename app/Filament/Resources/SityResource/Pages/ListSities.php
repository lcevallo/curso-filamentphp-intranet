<?php

namespace App\Filament\Resources\SityResource\Pages;

use App\Filament\Resources\SityResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSities extends ListRecords
{
    protected static string $resource = SityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
