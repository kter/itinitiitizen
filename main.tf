resource "google_storage_bucket" "usercontent" {
  name     = "usercontent.itizen.kter.jp"
  location = "asia-northeast1"

  website {
  }
}
