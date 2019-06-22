provider "google" {
  credentials = "${file("/Users/takahashi.t/.gsutil/itinitiitizen-224108-0fdafd1b4c46.json")}"
  project     = "itinitiitizen-224108"
  region      = "asia-northeast1"
}
