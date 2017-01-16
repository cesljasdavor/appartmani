json.set!("number_of_actives", User.where(active: true).count)
