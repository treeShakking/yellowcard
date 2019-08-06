func main() {
	apiv := os.Getenv(apiEnv)
	// unset apiEnv to avoid side-effect for future env and flag parsing.
	os.Unsetenv(apiEnv)
	if len(apiv) == 0 || apiv == "3" {
		ctlv3.Start()
		return
	}

	if apiv == "2" {
		ctlv2.Start()
		return
	}

	fmt.Fprintln(os.Stderr, "unsupported API version", apiv)
	os.Exit(1)
}
