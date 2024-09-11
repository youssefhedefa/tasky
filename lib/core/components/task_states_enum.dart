enum TaskStatesEnum{
  all,
  inProgress,
  waiting,
  finished,
}

Map<TaskStatesEnum, String> taskStatesValues = {
  TaskStatesEnum.all: 'All',
  TaskStatesEnum.inProgress: 'In Progress',
  TaskStatesEnum.waiting: 'Waiting',
  TaskStatesEnum.finished: 'Finished',
};