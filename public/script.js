// Delete god

async function handleDeleteGod(name) {
  const url = `/god/${name}`;
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
    return window.location.reload();
  }
});
