# valid_string_concat.tftest.hcl

variables {
  strResourceGroupName = "test"
}

run "valid_string_concat" {

  command = plan

  assert {
    condition     = azurerm_resource_group.rgterraform.name == "test"
    error_message = "Resource name is not matching"
  }

}
