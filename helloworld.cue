// usage: dagger do hello --log-format=plain
package helloworld

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
)

dagger.#Plan & {
	client: env: GREETING: string | *"hello"

	actions: {
		image: core.#Pull & {
			source: "alpine:3"
		}
		hello: core.#Exec & {
			input: image.output
			args: ["echo", "\(client.env.GREETING), world!"]
			always: true
		}
	}

}
