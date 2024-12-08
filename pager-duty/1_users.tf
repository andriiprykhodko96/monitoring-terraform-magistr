# Users which are the part of on call team 

resource "pagerduty_user" "sshovak" {
  name      = "Slavik Shovak"
  email     = "slavik.sh@lll.kpi.ua"
  role      = "admin"
  time_zone = "Europe/Kiev"
  color     = "purple"
}

resource "pagerduty_user" "mtostonozhenko" {
  name      = "Mykhailo Tovstonozhenko"
  email     = "misha.to@lll.kpi.ua"
  role      = "admin"
  time_zone = "Europe/Kiev"
  color     = "royal-blue"
}

resource "pagerduty_user" "mhonchar" {
  name      = "Maria Honchar"
  email     = "mariia.go@lll.kpi.ua"
  role      = "admin"
  time_zone = "Europe/Kiev"
  color     = "dark-olive-green"
}

resource "pagerduty_user" "kshakhova" {
  name      = "Kate Shakhova"
  email     = "kateryna.sh@lll.kpi.ua"
  role      = "admin"
  time_zone = "Europe/Kiev"
  color     = "dark-cyan"
}