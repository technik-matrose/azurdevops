resource "azurerm_network_interface" "" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "${var.admin_username}"
  network_interface_ids = []
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwkcPsYXjLYFuzAg1g79y74ANxbe/pSRbR4Ai10WjfNgQMbVZtmpzCkqHidG3MJ3d7SFrO2y6D5VmVTPDww2RzbF6DTE5mkWObjwlBz1Z/PRzKhS77Iz2/SFblkEJe5oTc4iPiJWAkI0RhO03zXWs2L6sSMJycR1Tbj674wXFa/CTid+lL9abCbNSTarFukJmrWWDxw2lw9I8/u+qkJ4wwBE0ffA40QrFMSyIuD1M7mx/5CEsKshEn8pwQZpXGOYNrGzhcShmJTuVW+h8Tcx/mRNswX+mI3b/2YiE3zN7jUVjThx6UqO9zAnLhdfRDX0cDS2RV0UmrT+TOQDELluoILeCv/NgRZLW0WxO8YMy3QcLuP/U63aQVhfWk5MrxOait6xwlbkke1w4emZu63gB4nIi/+ardJK/gs8aSsOX+MB0ZYUUthWHnS9hsvz+vw4nvCyGh7exEhKZ/ehD/e/lrYHEwVvVgxoKuSjWWrBunMtDNtnl0MjO1jp8zHXZhzjk= odl_user@cc-cecaaf45-5dc7cc5cff-flpms"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
