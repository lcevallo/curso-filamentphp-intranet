<?php

namespace App\Filament\Resources\SityResource\Pages;

use App\Filament\Resources\SityResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSity extends EditRecord
{
    protected static string $resource = SityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
