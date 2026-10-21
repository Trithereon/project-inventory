// Delete god

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

document.addEventListener("click", async (e) => {
  if (e.target.dataset.action === "deleteGod") {
    await handleDeleteGod(e.target.dataset.id);
  } else if (e.target.dataset.action === "deletePantheon") {
    await handleDeletePantheon(e.target.dataset.id);
  } else return;
  return window.location.reload();
});
