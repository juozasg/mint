/* Represents a subscription for `Provider.AnimationFrame` */
record Provider.AnimationFrame.Subscription {
  frames : Function(Promise(Never, Void))
}

/* A provider for the `requestAnimationFrame` API. */
provider Provider.AnimationFrame : Provider.AnimationFrame.Subscription {
  state id : Number = -1

  /* Call the subscribers. */
  fun process : Promise(Never, Void) {
    try {
      for (subscription of subscriptions) {
        subscription.frames()
      }

      next { id = AnimationFrame.request(process) }
    }
  }

  /* Updates the provider. */
  fun update : Promise(Never, Void) {
    if (Array.isEmpty(subscriptions)) {
      next { id = AnimationFrame.cancel(id) }
    } else if (id == -1) {
      next { id = AnimationFrame.request(process) }
    } else {
      next {  }
    }
  }
}
