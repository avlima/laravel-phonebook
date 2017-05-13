<?php

namespace App\Http\Controllers;

use App\Contracts\AgendaInterface;
use App\Enum\SituationEnum;
use Carbon\Carbon;

class HomeController extends Controller
{
    /**
     * @var AgendaInterface
     */
    private $agenda;

    /**
     * HomeController constructor.
     * @param AgendaInterface $agenda
     */
    public function __construct(AgendaInterface $agenda)
    {
        $this->agenda = $agenda;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $completed = $this->agenda->getByCriteria([
            [
                'column' => 'completed',
                'operator' => '=',
                'value' => SituationEnum::YES
            ]
        ])->count();

        $late = $this->agenda->getByCriteria([
            [
                'column' => 'date',
                'operator' => '<',
                'value' => Carbon::now()
            ],
            [
                'column' => 'completed',
                'operator' => '=',
                'value' => SituationEnum::NO
            ]
        ])->count();

        $not_complete = $this->agenda->getByCriteria([
            [
                'column' => 'completed',
                'operator' => '=',
                'value' => SituationEnum::NO
            ]
        ])->count();

        $total_agenda = $this->agenda->getByCriteria(null)->count();

        return view('home', [
            'completed' => $completed,
            'late' => $late,
            'not_complete' => $not_complete,
            'total_agenda' => $total_agenda
        ]);
    }
}
