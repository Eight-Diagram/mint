require "../spec_helper"

describe "Statement" do
  subject statement

  expect_ignore ""
  expect_ignore "??"
  expect_ignore "✔"
  expect_ignore "a ="
  expect_ignore "a = "

  expect_ok "a = a"
end
