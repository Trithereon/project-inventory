function toggleForm(id) {
  const form = document.getElementById(id);
  return form.classList.toggle("visible");
}

async function handleDeleteGod(id) {
  const url = `/god/${id}`;
  try {
    const res = await fetch(url, { method: "DELETE" });
    if (!res.ok) {
      throw new Error(`Response status: ${res.status}`);
    }
  } catch (error) {
    console.error(error.message);
  }
}

async function handleDeletePantheon(name) {
  const url = `/pantheon/${name}`;
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
  if (!handler) return;

  await handler.fn(id);
  if (handler.reload) return window.location.reload();
  else return;
});
