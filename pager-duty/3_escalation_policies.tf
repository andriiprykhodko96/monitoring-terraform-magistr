# Define escalation poilicy for main on-call schedule 

resource "pagerduty_escalation_policy" "engineering_policy" {
  name      = "Engineering Escalation Policy"
  num_loops = 2

  rule {
    escalation_delay_in_minutes = 10
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.main-oncall.id
    }
  }

  rule {
    escalation_delay_in_minutes = 10
    target {
      type = "user_reference"
      id   = pagerduty_user.mhonchar.id
    }
  }

  rule {
    escalation_delay_in_minutes = 20
    target {
      type = "user_reference"
      id   = pagerduty_user.sshovak.id
    }
  }
}