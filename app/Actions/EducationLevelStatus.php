<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class EducationLevelStatus extends AbstractAction
{
    public function getTitle()
    {
        // Action title which display in button based on current status
        return $this->data->{'status'}=="Active"?'Deactivate':'Activate';
    }

    public function getIcon()
    {
        // Action icon which display in left of button based on current status
        return $this->data->{'status'}=="Active"?'voyager-power':'voyager-power';
    }

    public function getAttributes()
    {
        // Action button class
        return [
            'class' => $this->data->{'status'}=="Active"?'btn btn-sm btn-deactivate':'btn btn-sm btn-activate',

        ];
    }

    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        return $this->dataType->slug == 'education-levels';
    }

    public function getDefaultRoute()
    {
        // URL for action button when click
        return route('edu_level.status', $this->data->{$this->data->getKeyName()} );
    }
}
