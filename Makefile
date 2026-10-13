PKL ?= pkl
OUT ?= out
VERSION ?= 0.0.1

.PHONY: render validate package

render:
	@mkdir -p "$(OUT)"
	@$(PKL) eval -o "$(OUT)/piper.yaml" examples/piper.pkl

validate: render
	@$(PKL) eval examples/piper.pkl >/dev/null
	@echo "pkl-piper validation succeeded."

package:
	@PKG_VERSION="$(VERSION)" $(PKL) project package --output-path dist
