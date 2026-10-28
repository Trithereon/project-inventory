// Edit form handling, to convert a POST to a PUT.
// Instead of adding event listeners to each form, just use one and delegate.
document.addEventListener("submit", async (e) => {
  const form = e.target;
  if (!form.matches('[data-form="edit"]')) {
    return;
  }

  e.preventDefault();

  const data = Object.fromEntries(new FormData(form));

  try {
    const res = await fetch(form.action, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    });
    if (res.ok) {
      window.location.reload();
    }
  } catch (err) {
    console.error(err);
  }
});

function toggleForm(id) {
  const form = document.getElementById(id);
  return form.classList.toggle("visible");
}

async function handleDeleteGod(id) {
  const url = `/god/delete/${id}`;
  try {
    const res = await fetch(url, { method: "DELETE" });
    if (!res.ok) {
      throw new Error(`Response status: ${res.status}`);
    }
  } catch (error) {
    console.error(error.message);
  }
}

async function handleDeletePantheon(id) {
  const url = `/pantheon/delete/${id}`;
  try {
    const res = await fetch(url, { method: "DELETE" });
    if (!res.ok) {
      throw new Error(`Response status: ${res.status}`);
    }
  } catch (error) {
    console.error(error.message);
  }
}

const actionHandlers = {
  deleteGod: { fn: handleDeleteGod, reload: true },
  deletePantheon: { fn: handleDeletePantheon, reload: true },
  toggleForm: { fn: toggleForm, reload: false },
};

document.addEventListener("click", async (e) => {
  const { action, id } = e.target.dataset;
  const handler = actionHandlers[action];
  if (!handler) {
    return;
  }

  await handler.fn(id);
  if (handler.reload) {
    return window.location.reload();
  } else {
    return;
  }
});
