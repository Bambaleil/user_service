FROM python:3.10-slim-bullseye AS builder

WORKDIR /user_service

ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONPATH=/user_service

COPY poetry.lock pyproject.toml ./

RUN python -m pip install --no-cache-dir poetry==2.1.1 && \
    poetry config virtualenvs.in-project true && \
    poetry install --no-interaction --no-ansi --no-root && \
    rm -rf $(poetry config cache-dir)/{cache,artifacts}

FROM python:3.10-slim-bullseye

WORKDIR /user_service
ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONPATH=/user_service

COPY --from=builder /user_service /user_service
COPY . /user_service


CMD ["python", "app/main.py"]