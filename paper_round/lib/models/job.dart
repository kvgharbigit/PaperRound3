class Job {
  final String patientName;
  final String description;
  final String? assignee;

  const Job(this.patientName, this.description, [this.assignee]);
}

const List<Job> dummyJobs = [
  Job('Mike Oxlong', 'Consent for penis shortening surgery', 'Kayvan'),
  Job('Ben Dover', 'Physio referral', 'Sohil'),
  Job('Jenny Talia', 'Penis Inspection Day (PID)'),
];
