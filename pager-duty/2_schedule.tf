# Main on-call schedule

resource "pagerduty_schedule" "main-oncall" {
  name      = "On call Rotation"
  time_zone = "Europe/Kiev"

  layer {
    name                         = "Rotations Shifts"
    start                        = "2024-11-12T00:00:00-00:00"
    rotation_virtual_start       = "2024-11-12T00:00:00-00:00"
    rotation_turn_length_seconds = 86400
    users = [pagerduty_user.sshovak.id,
            pagerduty_user.kshakhova.id,
            pagerduty_user.mhonchar.id,
            pagerduty_user.mtostonozhenko.id, ]
  }

}

